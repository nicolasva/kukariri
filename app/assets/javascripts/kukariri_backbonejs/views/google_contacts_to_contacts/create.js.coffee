class App.Views.GoogleContactsToContacts.Create extends Backbone.View
  el: ".container"
  template: JST["kukariri_backbonejs/templates/google_contacts_to_contacts/create"]
  scope: 'https://www.google.com/m8/feeds'
  google_load: google.load("gdata", "1.x")
  contactsFeedUri: 'https://www.google.com/m8/feeds/contacts/default/full?v=3.0&alt=json'

  initialize: (options) ->
    @contact = options.contact
    @google_load
    @logMeIn = @logMeIn()
    @setOnLoadCallback = google.setOnLoadCallback(initFunc)
    @entries = ""
    @tab_contact = new Array()
    @contactsService = @setupContactsService()
    @getSetContact()

  setupContactsService: ->
    contactsService = new google.gdata.contacts.ContactsService('GoogleInc-jsguide-1.0')
    return contactsService

  logMeIn: ->
    return google.accounts.user.login(@scope)

  logMeOut: ->
    google.accounts.user.logout() if google.accounts.user.checkLogin(@scope)

  getMyContacts: ->
    query = new google.gdata.contacts.ContactQuery(@contactsFeedUri)
    @contactsService.getContactFeed(query, @handleContactsFeed, @handleError)

  handleContactsFeed: (result) ->
    @entries = result.feed.entry
    address =
      firstname: @getFirstName()
      lastname: @getLastName()
      address: @getStreet()
      city: @getCity()
      country: @getCountry()
      zip: @getPostcode()
      phone: @getPhone()
      mail: @getEmail()
      organization: @getOrganization()
      birthday: @getBirthday()
      event: @getEvent()
    @tab_contact.push(address)

  @getSetContact: ->
    console.log @tab_contact

  getFirstName: ->
    if _.isNull(@entries.gd$name) || _.isNull(@entries.gd$name.gd$givenName) || _.isNull(@entries.gd$name.gd$givenName.$t)
      return ""
    else
      return entry.gd$name.gd$givenName.$t

  getLastName: ->
    if _.isNull(@entries.gd$name) || _.isNull(@entries.gd$name.gd$familyName)  || _.isNull(@entries.gd$name.gd$familyName.$t) 
      reutrn ""
    else
      return @entries.gd$name.gd$familyName.$t

  getAdditionalName: ->
    if _.isNull(@entries.gd$name) || _.isNull(@entries.gd$name.gd$AdditionalName) || _.isNull(@entries.gd$name.gd$AdditionalName.$t)
      return ""
    else
      return @entries.gd$name.gd$familyName.$t

  getEmail: ->
    if _.isNull(@entries.gd$email) || _.isEqual(@entries.gd$email.length, 0) || _.isNull(@entries.gd$email[0].address)
      return ""
    else
      return @entries.gd$email[0].address

  getStreet: ->
    if !@addrExists() || _.isNull(@entries.gd$structuredPostalAddress[0].gd$street)
      return ""
    else
      return @entries.gd$structuredPostalAddress[0].gd$street.$t

  getCity: ->
    if !@addrExists() || _.isNull(@entries.gd$structuredPostalAddress[0].gd$city)
      return ""
    else
      return @entries.gd$structuredPostalAddress[0].gd$city.$t

  getCountry: ->
    if !@addrExists() || _.isNull(@entries.gd$structuredPostalAddress[0].gd$country)
      return ""
    else
      return @entries.gd$structuredPostalAddress[0].gd$country.$t

  getPostcode: ->
    if !@addrExists() || _.isNull(@entries.gd$structuredPostalAddress[0].gd$postcode)
      return ""
    else
      return @entries.gd$structuredPostalAddress[0].gd$postcode.$t

  getPhone: ->
    if _.isNull(@entries.gd$phoneNumber) || _.isEqual(@entries.gd$phoneNumber.length, 0)
      return ""
    else
      return @entries.gd$phoneNumber[0].$t

  getOrganization: ->
    if _.isNull(@entries.gd$organization) || _.isEqual(@entries.gd$organization.length, 0) || _.isNull(@entries.gd$organization[0].getOrgName())
      return ""
    else
      return @entries.gd$organization[0].getOrgName().getValue()

  getBirthday: ->
    if _.isNull(@entries.gContact$birthday) || _.isNull(@entries.gContact$birthday.when)
      return ""
    else
      return @entries.gContact$birthday.when

  getEvent: ->
    if _.isNull(@entries.gContact$event) || _.isEqual(@entries.gContact$event.length, 0)
      return ""
    else
      return @entries.gContact$event[0].gd$when.startTime

  addrExists: ->
    if _.isNull(@entries.gd$structuredPostalAddress) || _.isEqual(@entries.gd$structuredPostalAddress.length, 0)
      return false
    else
      return true

