public with sharing class YoutubeResult {

    //public static final String API_Key = 'AIzaSyBDMZeHT1zBOlxgB8JW7tqwYr2BIsRQz6A';
    public static final String Endpoint = 'https://www.googleapis.com/youtube/v3/search?part=snippet%20&maxResults=20&type=video&q=Baran%20Zeylan&key=AIzaSyBDMZeHT1zBOlxgB8JW7tqwYr2BIsRQz6A';

    @AuraEnabled
    public static list<lwcWrapper> getVideos(){
        
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(Endpoint);
        request.setMethod('GET');
        HttpResponse response = http.send(request);

        system.debug(response.getBody());
        YoutubeResponse.Response result = (YoutubeResponse.Response) Json.deserialize(response.getBody(),YoutubeResponse.Response.class);
    	
        List<YoutubeResponse.Item> items = result.items;
        List<lwcWrapper> resultforLwc = new List<lwcWrapper>();
        for(YoutubeResponse.Item item: items){
            
            lwcWrapper yt = new lwcWrapper();
            
            yt.videoId =item.id.videoId;
            yt.description =item.snippet.description;
            yt.thumbnails =item.snippet.thumbnails.medium.url;
            yt.title =item.snippet.title;
            yt.channelTitle =item.snippet.channelTitle;
            yt.publishedAt =item.snippet.publishedAt;
			resultforLwc.add(yt);
            
        }
    return resultforLwc;
    }
    
    
    public class lwcWrapper {
        
        @AuraEnabled public string videoId {get;set;}
        @AuraEnabled  public Datetime publishedAt {get;set;}
        @AuraEnabled  public String title {get;set;}
        @AuraEnabled  public String description {get;set;}
        @AuraEnabled  public String channelTitle {get;set;}
        @AuraEnabled  public String thumbnails {get;set;}
    }
    
    
}