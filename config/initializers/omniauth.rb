OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do  
  provider :facebook, '291108464340769', '9477008c23b47cd9d217cea5bee24444'
  provider :twitter, '8900N8yA502wuFtlxAevVA', 'ZEytQJj893aNYPcKLie6su4hATsafOgBpRMMlc8jVug'  
end