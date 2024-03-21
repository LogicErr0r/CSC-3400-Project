import requests
from bs4 import BeautifulSoup

def scrape_menu():
    URL = "https://www.flsouthern.edu/campus-offices/offices-directory/office-of-dining-services/daily-menu"
    page = requests.get(URL)

    # Prints HTML of page for debugging purposes
    # print(page.text)

    soup = BeautifulSoup(page.content, "html.parser")

    # extract all div tags that have class fr-view
    results = soup.find_all("div", class_="fr-view")
    for result in results:
        # extract value within h3 tags
        meal_type = result.find("h3")
        print(f"*******MEAL TYPE:{meal_type.text}")


        # extract each list item within the li tags
        menu_items = result.find_all("li")
        for item in menu_items:
            print(item.text)

        # Code below prints menu in html format for debugging
        # print(result.prettify())

scrape_menu()