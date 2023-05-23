#!/bin/env python3

#                ____________________________________________
#                | Welcome to Aira, your ultimate assistant |
#                |               guidance!                  | 
#                |------------------------------------------|
#                |              By @Neev0Slid               |
#                |__________________________________________|


import openai
import argparse
import apiKey

#pls paste your api-key that you obtian from "https://platform.openai.com" in the py file named "apiKey.py" #
openai.api_key = apiKey.my_apiKey

def chat(input_text):
    response = openai.Completion.create(
        engine="text-davinci-003",
        prompt=input_text,
        max_tokens=3000,
        temperature=0.7,
        n=1,
        stop=None,
        echo=False
    )
    return response.choices[0].text.strip()

def main():
    parser = argparse.ArgumentParser(description="ChatGPT CLI")
    parser.add_argument("--prompt", "-p", type=str, required=True, help="Prompt for the conversation")
    args = parser.parse_args()

    response = chat(args.prompt)
    print("")
    print("===>" + response)


if __name__ == "__main__":
    main()
