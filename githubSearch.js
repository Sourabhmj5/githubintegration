import { LightningElement,track ,wire } from 'lwc';
import searchUsers from '@salesforce/apex/githubLWCController.searchUsers';
import lmsGithub from'@salesforce/messageChannel/LMSGithubIntegration__c';
import {MessageContext,publish} from 'lightning/messageService';

export default class GithubSearch extends LightningElement {
    @wire(MessageContext)context;
@track users=[];
searchValue;
get usersExist(){
return this.users?.length > 0 ? true : false;
}
handleChange(event){
this.searchValue=event.target.value;
}
handleSearch(){
    searchUsers({searchValue:this.searchValue})
    .then(result => {
    let objResult =JSON.parse(result);
    this.users=objResult?.items;
    }).catch(err => {
        alert('Error :'+JSON.stringify(err));
    }) 
}
handleClick(e){
//alert(e.target.name+ ' ' +e.target.value);
const message={
user:this.users.filter(u => u.id===e.target.value)[0]
}
publish(this.context,lmsGithub,message);
}
}