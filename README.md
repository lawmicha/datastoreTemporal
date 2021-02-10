### DataStore with a Model containing Temporal types

**schema.graphql**
```
type Todo @model {
  id: ID!
  dateTime: AWSDateTime
  date: AWSDate
  time: AWSTime
}
```

1. `amplify init`, `amplify add api` and use the above schema, `amplify update api` and enable for datastore, `amplify push`

2. `amplify codegen models`

3. `pod install --repo-update` and open app `xed .`

4. run app and click on Save, update the queryId to Query directly from AppSync

5. `amplify console api` to check the data from the AppSync's Queries tab