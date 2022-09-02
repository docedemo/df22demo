public with sharing class ProductController {
    static Integer PAGE_SIZE = 9;

    public class Filters {
        @AuraEnabled
        public String searchKey { get; set; }
        @AuraEnabled
        public Decimal maxPrice { get; set; }
        @AuraEnabled
        public String[] categories { get; set; }
        @AuraEnabled
        public String[] materials { get; set; }
        @AuraEnabled
        public String[] levels { get; set; }
        @AuraEnabled
        public String[] statuses { get; set; }
    }

    @AuraEnabled(Cacheable=true)
    public static PagedResult getProducts(Filters filters, Integer pageNumber) {
        //Build SOQL WHERE clause based on filters
        String key, whereClause = '';
        Decimal maxPrice;
        String[] categories, materials, levels, criteria = new List<String>{};
        String[] statuses = new List<String>{};
        if (filters != null) {
            maxPrice = filters.maxPrice;
            materials = filters.materials;
            levels = filters.levels;
            categories = filters.categories;
            statuses = filters.statuses;
            if (!String.isEmpty(filters.searchKey)) {
                key = '%' + filters.searchKey + '%';
                criteria.add('Name LIKE :key');
                System.debug(key);
            }
            if (filters.maxPrice >= 0) {
                maxPrice = filters.maxPrice;
                criteria.add('MSRP__c <= :maxPrice');
                System.debug(maxPrice);
            }
            if (filters.categories != null) {
                categories = filters.categories;
                criteria.add('Category__c IN :categories');
                System.debug(categories);
            }
            if (filters.levels != null) {
                levels = filters.levels;
                criteria.add('Level__c IN :levels');
                System.debug(levels);
            }
            if (filters.materials != null) {
                materials = filters.materials;
                criteria.add('Material__c IN :materials');
            }
            if (filters.statuses != null) {
                statuses = filters.statuses;
                criteria.add('Status__c IN :statuses');
            }
            if (criteria.size() > 0) {
                whereClause = 'WHERE ' + String.join(criteria, ' AND ');
            }
        }

        //Get page Info
        Integer pageSize = ProductController.PAGE_SIZE;
        Integer offset = (pageNumber - 1) * pageSize;

        //Get total number of records
        Integer totalItemCount = Database.countQuery(
            'SELECT count() FROM Product__c ' + whereClause
        );

        //Get records for the current page
        List<Product__c> products = Database.query(
            'SELECT Id, Name, MSRP__c, isRefurbished__c, Description__c, Category__c, Level__c, Picture_URL__c, Material__c FROM Product__c ' +
            whereClause +
            ' WITH SECURITY_ENFORCED' +
            ' ORDER BY Name LIMIT :pageSize OFFSET :offset'
        );

        //Return Paginated results
        PagedResult result = new PagedResult();
        result.pageSize = pageSize;
        result.pageNumber = pageNumber;
        result.totalItemCount = totalItemCount;
        result.records = products;
        return result;
    }

    @AuraEnabled(Cacheable=true)
    public static Product__c[] getSimilarProducts(Id productId, Id familyId) {
        return [
            SELECT
                Id,
                Name,
                MSRP__c,
                Description__c,
                Category__c,
                Level__c,
                Picture_URL__c,
                Material__c
            FROM Product__c
            WHERE Product_Family__c = :familyId AND Id != :productId
            WITH SECURITY_ENFORCED
        ];
    }
}