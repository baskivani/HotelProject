

public class YouTubeResult1{
    public List<YouTubeResult1.Item> items { get; set; }    
    public class Response {
        public String kind { get; set; }
        public String etag { get; set; }
        public String nextPageToken { get; set; }
        public String prevPageToken { get; set; }
        public YouTubeResult1.PageInfo pageInfo { get; set; }
        public List<YouTubeResult1.Item> items { get; set; }
    }
    
    public class PageInfo {
        public Integer totalResults { get; set; }
        public Integer resultsPerPage { get; set; }
    }
    
    public class Item {
        public String kind { get; set; }
        public String etag { get; set; }
        public YouTubeResult1.Id id { get; set; }
        public YouTubeResult1.Snippet snippet { get; set; }
    }
    
    public class Id {
        public String kind { get; set; }
        public String videoId { get; set; }
    }
    
    public class Snippet {
        public Datetime publishedAt { get; set; }
        public String channelId { get; set; }
        public String title { get; set; }
        public String description { get; set; }
        public YouTubeResult1.Thumbnails thumbnails { get; set; }
        public String channelTitle { get; set; }
        public String liveBroadcastContent { get; set; }
    }
    
    public class Thumbnails {
        public YouTubeResult1.Thumbnail medium { get; set; }
        public YouTubeResult1.Thumbnail high { get; set; }
    }
    
    public class Thumbnail {
        public String url { get; set; }
    }
}