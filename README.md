# Community Garden

This repository requires and has been tested on Ruby v3.2.2 and is based on Rails 7.1.4.

RSpec and Shoulda-Matchers have been installed and set up.

## Setup

1. fork this repo
2. clone your fork
3. `git clone <repo_name>`
4. `cd <repo_name>`
5. `bundle install`
6. `rails db:{drop,create,migrate,seed}`

When you run `bundle exec rspec` you should have 2 passing tests.

## Overview

Community Garden is an app that tracks Gardens, Plots, and Plants.

* Gardens have a name and an 'organic' boolean column
  * Ex: `name: "Turing Community Garden", organic: true`
* Plots have a size and a direction
  * Ex: `size: "Large", direction: "East"`
* Plants have a name, description, and days to harvest.
  * Ex: `name: "Purple Beauty Sweet Bell Pepper", description: "Prefers rich, well draining soil.", days_to_harvest: 90`
  
* Gardens have many plots
* Plots belong to a Garden
* Plants can be in many Plots
* Plots have many Plants
* When plants are added to a plot, users can indicate how many seedlings are being added.

Some of the initial migrations and model set up has been done for you.

## Endpoints

```
#1, Plot Info

GET "api/v1/plots/:id"

Returns plot attributes, as well as a custom attribute that will indicate all the plants that are in the plot in a comma separated list.

Sample Response:
{
  "data": 
    {
      "id": "2",
      "type": "plot",
      "attributes": {
        "size": "small",
        "direction": "NW"
        "garden_id": 1,
        "plant_list": "Italian Basil, Cherry Tomatoes, Dahlias"
      }
    }
}
```

```
Endpoint #2, Add a Plant to a Plot

POST "/api/v1/plots/:id/plants

Sample POST Request:
{
  plant_id: 4,
  num_seedlings, 3
}

Sample Response could be a 204, or a response similar to #1 that now lists the new plant in the plant list. Your Choice
```

```
Endpoint #3, Garden's Plants (filtered)

GET "/api/v1/gardens/:id"
optional param: { time_to_harvest: X }

Returns all the plants in a garden that have a time to harvest that is less than the query parameter passed, or all plants in a garden when no query parameter is passed.

Sample Response:
{
  data: [
    {
      "id": "4",
      "type": "plant",
      "attributes":
        {
          "name": "Italian Basil",
          "description": "it's yummy",
          "time_to_harvest": 55
        }
    },
    {
      "id": "6",
      "type": "plant",
      "attributes":
        {
          "name": "Cherry Tomato",
          "description": "small n cute",
          "time_to_harvest": 65
        }
    },
    {
      "id": "4",
      "type": "plant",
      "attributes":
        {
          "name": "Sunflower",
          "description": "this will get big",
          "time_to_harvest": 77
        }
    }
  ]
}
```

## Extensions

```
Extension 1

Endpoint to remove a plant from a plot. This should NOT delete the plant record from the plants table.
```
