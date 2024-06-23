import { LightningElement, track, wire } from 'lwc';
import getVideos from '@salesforce/apex/YoutubeResult.getVideos';

export default class YoutubeVideos extends LightningElement {
    @track videos;
    @track error;

    @wire(getVideos)
    wiredVideos({ error, data }) {
        if (data) {
            this.videos = data;
            this.error = undefined;
        } else if (error) {
            this.error = error;
            this.videos = undefined;
        }
    }
}
