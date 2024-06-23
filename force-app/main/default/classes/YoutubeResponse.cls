public  class  YoutubeResponse {
    
    public class Response {
        public String kind {get;set;}
        public String etag {get;set;}
        public String nextPageToken {get;set;}
        public String regionCode {get;set;}
        public PageInfo pageInfo {get;set;}
        public list<Item> items {get;set;}
                
    }   
    public class PageInfo{
        
        public Integer totalResults {get;set;}
        public Integer resultsPerPage {get;set;}
    }
  public class Item{
        
        public String kind {get;set;}
        public String etag {get;set;}
      	public Ids id {get;set;}
        public Snippet snippet {get;set;}

    }  
    public class Ids{
        
        public String kind {get;set;}
        public String videoId {get;set;}
    }  
    
    public class Snippet{
        
        public Datetime publishedAt {get;set;}
        public String channelId {get;set;}
        public String title {get;set;}
        public String description {get;set;}
        public String channelTitle {get;set;}
        public  Thumbnails thumbnails {get;set;}

    } 
    public class Thumbnails {
        
        public Thumbnail medium {get;set;}
        public Thumbnail high {get;set;}
    } 
    
public class Thumbnail {
        
        public String url {get;set;}
    }  
 }