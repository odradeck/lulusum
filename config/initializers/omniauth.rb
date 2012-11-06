OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do  
  provider :facebook, '430185663697400', '84fdb9e2cbfab6cbd9e736c36158ebfd'
  provider :twitter, '8900N8yA502wuFtlxAevVA', 'ZEytQJj893aNYPcKLie6su4hATsafOgBpRMMlc8jVug'  
end