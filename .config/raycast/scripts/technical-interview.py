#!/usr/bin/env /Users/dan/.pyenv/shims/python

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Technical Interview
# @raycast.mode fullOutput

# Optional parameters:
# @raycast.icon 🤖
# @raycast.argument1 { "type": "text", "placeholder": "Placeholder" }
# @raycast.packageName Developer Utils

# Documentation:
# @raycast.author danndz
# @raycast.authorURL https://raycast.com/danndz


import sys
import anthropic
import os
import dotenv

dotenv.load_dotenv()

interview_question = sys.argv[1]

client = anthropic.Anthropic(
    api_key=os.environ.get("ANTHROPIC_API_KEY"),
)

# message = client.messages.create(
#     model="claude-3-5-sonnet-20241022",
#     max_tokens=8192,
#     temperature=0,
#     messages=[
#         {
#             "role": "user",
#             "content": [
#                 {
#                     "type": "text",
#                     "text": "You are a highly experienced senior software engineer candidate interviewing for a position. Your goal is to demonstrate your in-depth knowledge, problem-solving skills, and relevant experience through your answers. You will be presented with a technical or behavioral interview question, and you should respond as if you are in an actual interview.\n\nHere is the interview question:\n<question>\n"
#                     + problem
#                     + "\n</question>\n\nWhen formulating your response, follow these guidelines:\n\n1. Structure your answer in a clear and organized manner.\n2. Demonstrate your technical knowledge:\n   - Use appropriate technical terms and concepts relevant to the question.\n   - Explain complex ideas in a way that shows both your understanding and your ability to communicate effectively.\n   - If applicable, mention specific technologies, frameworks, or methodologies you're familiar with.\n\n3. Showcase your problem-solving skills:\n   - If the question involves a problem, outline your approach to solving it.\n   - Discuss any trade-offs or considerations you would take into account.\n   - If relevant, mention how you would break down the problem into smaller, manageable parts.\n\n4. Highlight relevant experience:\n   - Draw from your (hypothetical) past experiences to provide concrete examples.\n   - Describe situations where you've dealt with similar issues or applied similar skills.\n   - Explain the outcomes of these experiences and what you learned from them.\n\n5. Demonstrate soft skills:\n   - Show your ability to work in a team, communicate effectively, and lead when necessary.\n   - Highlight your adaptability and willingness to learn new technologies or methodologies.\n\n6. Be concise yet thorough:\n   - Provide enough detail to fully answer the question, but avoid unnecessary verbosity.\n   - If the question has multiple parts, make sure to address all of them.\n\nFormulate your response and present it within <answer> tags. Remember to maintain a professional tone throughout your response, as if you were in an actual interview setting.",
#                 }
#             ],
#         }
#     ],
# )

message = client.messages.create(
    model="claude-3-5-sonnet-20241022",
    max_tokens=8192,
    temperature=0,
    messages=[
        {
            "role": "user",
            "content": [
                {
                    "type": "text",
                    "text": "You are a senior software engineer candidate interviewing for a position. Your goal is to demonstrate your expertise, problem-solving abilities, and relevant experience through your answers. You will be presented with a technical or behavioral interview question, and you should respond as if you are in an actual interview.\n\nHere is the interview question:\n\n<interview_question>\n"
                    + interview_question
                    + "\n</interview_question>\n\nBefore formulating your final response, take some time to analyze the question and plan your answer. Wrap your preparation in <interview_preparation> tags, including the following sections:\n\n1. Question Analysis: Break down the key components of the question.\n2. Relevant Experience: Identify past experiences that relate to the question.\n3. Technical Concepts: List relevant technical terms and concepts to include.\n4. Answer Outline: Create a brief outline for the structured response.\n\nWhen crafting your response, follow these guidelines:\n\n1. Structure: Organize your answer clearly and logically.\n\n2. Technical Knowledge:\n   - Use relevant technical terms and concepts.\n   - Explain complex ideas clearly, demonstrating both understanding and communication skills.\n   - Mention specific technologies or methodologies when applicable.\n\n3. Problem-Solving:\n   - Outline your approach to solving the problem.\n   - Discuss trade-offs and considerations.\n   - Break down complex problems into manageable parts if necessary.\n\n4. Experience:\n   - Provide concrete examples from your (hypothetical) past experiences.\n   - Describe similar situations you've encountered and how you handled them.\n   - Explain outcomes and lessons learned from these experiences.\n\n5. Soft Skills:\n   - Demonstrate teamwork, communication, and leadership abilities.\n   - Highlight your adaptability and willingness to learn.\n\n6. Conciseness:\n   - Provide thorough answers without unnecessary verbosity.\n   - Address all parts of multi-part questions.\n\nAfter your analysis, present your final response within <answer> tags. Maintain a professional tone throughout, as if you were in an actual interview.\n\nExample output structure:\n\n<interview_preparation>\n[Your analysis of the question and planning of your response, including the four sections mentioned above]\n</interview_preparation>\n\n<answer>\n[Your structured, professional response to the interview question]\n</answer>\n\nPlease proceed with your interview preparation and response to the interview question.",
                }
            ],
        },
        {
            "role": "assistant",
            "content": [{"type": "text", "text": "<interview_preparation>"}],
        },
    ],
)

print(message.content[0].text)
