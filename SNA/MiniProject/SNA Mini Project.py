import texttable as tt
from time import sleep
import xml.etree.ElementTree as ET
import requests
import re
from nltk.sentiment.vader import SentimentIntensityAnalyzer as SIA


def get_sentiment(title):
    sia = SIA()
    score = sia.polarity_scores(title)
    return score


def search_news(keyword):
    r = requests.get("https://news.google.com/rss/search?q=" + keyword + "&hl=en-IN&gl=IN&ceid=IN:en")
    xml_source = r.content.decode("utf-8")
    tree = ET.fromstring(xml_source)
    search_results_list = []
    positive_list = []
    negative_list = []
    neutral_list = []
    compound_list = []
    count = 0
    source_list = []
    for item in tree.findall("./channel/item"):
        for child in item:
            if child.tag == 'title' and count != 6:
                print(count)
                count+=1
                search_results = child.text
                search_results_list.append(search_results)
                site_split = re.split('-', search_results)
                source_list.append(site_split[1])

                a = get_sentiment(search_results)
                negative_list.append(a['neg'])
                positive_list.append(a['pos'])
                neutral_list.append(a['neu'])
                compound_list.append(a['compound'])
                sleep(2)

    tab = tt.Texttable()
    headings = ['Source', 'Data', 'Positive', 'Neutral', 'Negative', 'Compund']
    tab.header(headings)

    for row in zip(source_list, search_results_list, positive_list, neutral_list, negative_list, compound_list):
        tab.add_row(row)

    avg_score = (sum(compound_list) / len(compound_list))

    table = tab.draw()
    print(table)
    print("Average Score: " + str(avg_score))


search_news("trump")
sleep(2)
