import { LightningElement ,track,wire} from 'lwc';
import lmsGithub from'@salesforce/messageChannel/LMSGithubIntegration__c';
import {MessageContext,subscribe,unsubscribe,APPLICATION_SCOPE} from 'lightning/messageService';
import getUserDetails from '@salesforce/apex/githubLWCController.getUserDetails';
import getRepos from '@salesforce/apex/githubLWCController.getRepos';

export default class GithubDetails extends LightningElement {
    @wire(MessageContext)context;
    subscription;
    @track user;
    @track repos = [];
    get reposExist(){
        return this.repos?.length > 0 ? true : false;
    }

    connectedCallback(){
        this.subscribeMessageChannel();
    }
    subscribeMessageChannel()
    {
if(this.subscription)
{
    return;
}
subscribe(this.context,lmsGithub,(message) => {
    //alert(JSON.stringify(message.user));
    this.fetchUser(message.user.login);
}
,{scope:APPLICATION_SCOPE});
}
async fetchUser(login){
await getUserDetails({login})
.then(result =>{
alert(JSON.stringify(result));
this.user=JSON.parse(result);
}) 
.catch(err => alert('User Error is ::'+JSON.stringify(err)))

await getRepos({login})
.then(result =>{
alert(JSON.stringify(result));
this.repos=JSON.parse(result);
}) 
.catch(err => alert(' Repos Error is ::'+JSON.stringify(err)))

}
}