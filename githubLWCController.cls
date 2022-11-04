/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 11-03-2022
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public class githubLWCController {
  @AuraEnabled(cacheable=true)
  public static string searchUsers(string searchValue){
    try {
       Http ht = new Http();
       HttpRequest req = new HttpRequest();
       HttpResponse res=new HttpResponse();
       req.setMethod('GET');
       req.setTimeout(120000);
       req.setHeader('client_id','Iv1.c2dc9b784afce761');
       req.setHeader('client_secret','d59bd3de3c5191b55cec7ac3a8c9a600ffa27703');
       req.setEndpoint('https://api.github.com/search/users?q=' + searchValue + '&client_id=Iv1.c2dc9b784afce761&client_secret=d59bd3de3c5191b55cec7ac3a8c9a600ffa27703');
       res=ht.send(req);
       return res.getBody();
       //String responseBody = response.getBody(); 
    } catch (Exception e) {
        throw new AuraHandledException(e.getMessage());
    }
  }

  @AuraEnabled(cacheable=true)
  public static string getUserDetails(string login){
    try {
       Http ht = new Http();
       HttpRequest req = new HttpRequest();
       HttpResponse res=new HttpResponse();
       req.setMethod('GET');
       req.setTimeout(120000);
       req.setHeader('client_id','Iv1.c2dc9b784afce761');
       req.setHeader('client_secret','d59bd3de3c5191b55cec7ac3a8c9a600ffa27703');
       req.setEndpoint('https://api.github.com/users/' + login);
       res=ht.send(req);
       return res.getBody();
       //String responseBody = response.getBody(); 
    } catch (Exception e) {
        throw new AuraHandledException(e.getMessage());
    }
  }

  @AuraEnabled(cacheable=true)
  public static string getRepos(string login){
    try {
       Http ht = new Http();
       HttpRequest req = new HttpRequest();
       HttpResponse res=new HttpResponse();
       req.setMethod('GET');
       req.setTimeout(120000);
       req.setHeader('client_id','Iv1.c2dc9b784afce761');
       req.setHeader('client_secret','d59bd3de3c5191b55cec7ac3a8c9a600ffa27703');
       req.setEndpoint('https://api.github.com/users/' + login +'/repos');
       res=ht.send(req);
       return res.getBody();
       //String responseBody = response.getBody(); 
    } catch (Exception e) {
        throw new AuraHandledException(e.getMessage());
    }
  }
}