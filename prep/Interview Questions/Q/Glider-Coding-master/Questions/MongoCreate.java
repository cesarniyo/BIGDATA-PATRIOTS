"""
Complete the following scripts that creates a new user in MongoDB collection, then finds the user
that was just created and outputs it.

(There are multiple drop-downs in the below code, please select a correct response for each drop-down)
"""
// package com.jsmart;

import java.io.IOException;
import com.mongodb.*;

public class MongoCreate {
    public static void main(String[] args) {
        try {
            MongoClient mongoClient = new MongoClient("localhost" , 27017);
            DB db = mongoClient.getDB("mydb");
            DBCollection dbCollection = db.getCollection("users");

            BasicDB0bject document = new BasicDBObject();
            document.put("name", "Alex");
            document.put("age", 26);

            dbCollection.insert(document); // `insert` potential correct choice
            BasicDBObject searchQuery = new BasicDBObject();
            searchQuery.put("name", "Alex");

            DBCursor dbCursor = dbCollection.find(searchQuery); // `find` potential correct choice

            while (dbCursor.hasNext()){ // `hasNext` the correct choice
                System.out.println(dbCursor.next());
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
