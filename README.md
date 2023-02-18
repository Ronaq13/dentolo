# README

There are two rake tasks which scrape data from their corresponding sources. Use the following commands to run them:

```ruby
rake scrape:berghain
rake scrape:visitberlin
```

After successful completion of these tasks the `events` table will be populated. Now you can visit `http://localhost:3000/events` to see all event and can perform CRUD operations. 

The search is a simple prefix partial text search on all the data.

In the requirement is was mentioned to make it as production ready as possible, so I have added pagination. Yes, a lot can be done on this app like improving scrapping, UI/UX, testing. But as making production like is a never ending road, I would like to submit it. If you feel anything missing please let me know.  