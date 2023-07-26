function() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }

  var config = {
    env: env,
  	apiUrl: 'https://conduit.productionready.io/api'
    }

  if (env == 'dev') {
    config.userEmail = 'karate@test.com'
    config.userPassword = 'karate123'
    //testEnvUrl = 'http://www.mytesturl.com'
  } else if (env == 'qa') {
      config.userEmail = 'karate2@test.com'
      config.userPassword = 'karate456'
    //testEnvUrl = 'http://www.mydevurl.com'
  }

  //karate.configure('ssl', true);
  //karate.configure('proxy', 'http://127.0.0.1:8080');
  //karate.configure('ssl', 'TLSv1.2');
  var accessToken = karate.callSingle('classpath:helper/CreateToken.feature', config).authToken
  karate.configure('headers', {Authorization: 'Token ' + accessToken})
  karate.configure('connectTimeout', 60000);
  karate.configure('readTimeout', 120000)
  return config;
}