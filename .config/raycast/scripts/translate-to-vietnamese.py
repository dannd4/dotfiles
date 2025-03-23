#!/usr/bin/env /Users/dan/.pyenv/shims/python

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Translate to Vietnamese
# @raycast.mode fullOutput

# Optional parameters:
# @raycast.icon 🤖
# @raycast.argument1 { "type": "text", "placeholder": "Placeholder" }
# @raycast.packageName Productivity

# Documentation:
# @raycast.author danndz
# @raycast.authorURL https://raycast.com/danndz


import sys
import anthropic
import os
import dotenv

dotenv.load_dotenv()

source_text = sys.argv[1]

client = anthropic.Anthropic(
    api_key=os.getenv("ANTHROPIC_API_KEY"),
)

with client.messages.stream(
    model="claude-3-5-sonnet-20241022",
    max_tokens=8192,
    temperature=0,
    messages=[
        {
            "role": "user",
            "content": [
                {
                    "type": "text",
                    "text": f"You are a highly skilled translator with expertise in many languages. Your task is to identify the language of the provided text and accurately translate it into Vietnamese. Follow these steps:\n\n1. Carefully read the source text and identify its language by examining characteristics such as character sets, common words, and grammatical structures.\n\n<source_text>\n{source_text}\n</source_text>\n\n2. Translate the source text into Vietnamese. Ensure that your translation:\n   - Accurately conveys the meaning of the original text\n   - Preserves the tone and nuance of the original\n   - Maintains proper Vietnamese grammar, spelling, and punctuation\n   - Keeps technical terminology, especially related to software engineering, in its original form or commonly accepted Vietnamese equivalent\n   - Maintain all line breaks from the original text.\n\nYour response should contain only the translated text, without any additional comments or explanations. Do not use any tags or formatting in your output.",
                }
            ],
        }
    ],
) as stream:
    for text in stream.text_stream:
        print(text, end="", flush=True)
