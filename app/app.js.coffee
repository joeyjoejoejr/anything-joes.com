`import Resolver from 'resolver';`
`import parse_init from 'appkit/utils/parse_initializer';`
`import google_maps_init from 'appkit/utils/google_maps_initializer';`

App = Ember.Application.extend
  LOG_ACTIVE_GENERATION: true,
  LOG_MODULE_RESOLVER: true,
  LOG_TRANSITIONS: true,
  LOG_TRANSITIONS_INTERNAL: true,
  LOG_VIEW_LOOKUPS: true,
  modulePrefix: 'appkit', # TODO: loaded via config
  Resolver: Resolver['default']

App.initializer(parse_init)
App.initializer(google_maps_init)

`export default App;`
