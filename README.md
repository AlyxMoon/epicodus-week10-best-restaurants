# Epicodus Daily Project | Best Restaurants

Create a website where users can add their favorite restaurants based on the type of cuisine they offer.

- Add a Cuisine class. Build out all CRUD functionality (Create, Read, Update, Delete) for this class. Remember that "Read" means to view a particular cuisine and to list out all of the cuisines.
- Add a Restaurant class. Build out all CRUD functionality for this class.
- Add properties other than name to your Restaurant class so that you can display descriptive information about the restaurants.
- Make the connection between a cuisine and a restaurant in the database. A cuisine can have many restaurants, but a restaurant can only be attached to one cuisine.
- Allow a user to search for all of a cuisine's restaurants.

If you have time, go ahead and tackle the next few features.

- Now your application allows for users to review restaurants. Build out a Review class and make the relationship in the database so that a restaurant has many reviews. Pretend that the users who are reviewing the website are different from the user who added the restaurant.
- Display all of the reviews at the bottom of the restaurant's page.

## Setup Instructions

The setup instructions assume the following:
- You have a working instance of bash
- You have MySQL installed and currently running

1. Open a terminal instance in the root of the project
2. Run `bash scripts/script-initialize-db.sh`
  - This will create the necessary database with assumed default information, this is:
  - Username is `root`. If you wish to change this, append `-u your-user-name` to the command
  - Password is `epicodus`. If you wish to change this, append `-p your-password` to the command
    - alternatively for no password, append the `-P` flag to the command
  - DB Name is `epicodus_week10_best_restaurants`. If you wish to change this, append `-d database_name` to the command. The database does not need to exist, and any existing data be wiped out when the command runs.
  - An example would be `bash scripts/script-initialize-db.sh -u otherroot -p mypassword -d mydatabase`.
3. Start the project with `dotnet run` while in the `Restaurants` directory.