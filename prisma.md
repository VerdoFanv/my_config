# prisma (nodejs & postgresql) --
- ```npm i prisma --save-dev```
- ```npx prisma init```
- ```npx prisma migrate dev --name init```
- ```npx prisma migrate reset``` 
  > drop db, create a new db, apply migration & seed db with data

- ```@id``` 
  > define primary key
- ```@unique```
  > define unique value
- ```@db```
  > define custom byte data type
- ```js
  @relation(fields: [userId], references: [id], onDelete: Cascade | NoAction, onUpdate: Cascade | NoAction)
  ```
- ```?```
  > add this to set not null to false

## data type list
- Int
- BigInt
- String
- Boolean
- DateTime
- Float
- Json

## model queries
- options on any query = where | select | include
- findUnique --> retrive single data
- findFirst --> retrive single first data
- findMany --> retreive many data
- create --> add data to db
- update --> update data db
- updateMany --> update many data
- delete --> delete data from db
- deleteMany --> delete all data from table
- count --> retrieve data count
- $transaction([]) --> runs multiple prisma commands

## pagination
```js
findMany({
  skip: Int -> data skipped
  take: Int -> how many data take
})
```
## find data in multiple table
```js
findUnique({
  where: {} --> add field
  include: {} --> add field to include another key table
})
```

## order by
- ```orderBy: {}``` -> add field and order type