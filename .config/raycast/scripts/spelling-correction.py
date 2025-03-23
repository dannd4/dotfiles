#!/usr/bin/env /Users/dan/.pyenv/shims/python

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Spelling Correction
# @raycast.mode fullOutput

# Optional parameters:
# @raycast.icon 🤖
# @raycast.argument1 { "type": "text", "placeholder": "Placeholder" }
# @raycast.packageName Productivity

# Documentation:
# @raycast.author danndz
# @raycast.authorURL https://raycast.com/danndz

import os
import sys
import anthropic
import dotenv

dotenv.load_dotenv()

original_text = sys.argv[1]

client = anthropic.Anthropic(
    api_key=os.getenv("ANTHROPIC_API_KEY"),
)

with client.messages.stream(
    model="claude-3-5-sonnet-20241022",
    max_tokens=4096,
    temperature=0,
    messages=[
        {
            "role": "user",
            "content": [
                {
                    "type": "text",
                    "text": "You are tasked with improving the grammar, clarity, and overall quality of a given text while preserving its original meaning. Here's the text you need to work on:\n\n<original_text>\n"
                    + original_text
                    + "\n</original_text>\n\nFollow these steps to rewrite the text:\n\n1. Read the original text carefully to understand its meaning and tone.\n\n2. Identify any spelling mistakes, punctuation errors, verb tense issues, word choice problems, and other grammatical mistakes.\n\n3. Rewrite the text, making the following improvements:\n   - Correct all spelling and punctuation errors\n   - Ensure proper verb tense usage and agreement\n   - Improve word choice for clarity and precision\n   - Fix any grammatical issues\n   - Enhance sentence structure for better flow and readability\n\n4. Preserve the original meaning of the text as closely as possible. Do not add new information or remove important details.\n\n5. Maintain the original tone and style of the writing as much as possible while improving clarity.\n\n6. If the original text contains technical terms, jargon, or culturally specific references, retain these unless they are used incorrectly.\n\n7. Break up long, complex sentences into shorter ones if it improves readability, but be careful not to oversimplify the content.\n\n8. Ensure that the rewritten text is logically organized and coherent.\n\n9. After rewriting, review your work to make sure you've addressed all issues and that the text reads smoothly and clearly.\n\nYour response should contain only the rewritten text, without any additional comments or explanations. Do not use any tags or formatting in your output.\n\nRemember, your goal is to improve the text's grammar and clarity while staying true to its original meaning and style.",
                }
            ],
        }
    ],
) as stream:
    for text in stream.text_stream:
        print(text, end="", flush=True)
