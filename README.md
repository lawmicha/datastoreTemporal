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