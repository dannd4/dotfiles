#!/usr/bin/env /Users/dan/.pyenv/shims/python

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title DSA Problem-Solving
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

problem = sys.argv[1]

client = anthropic.Anthropic(
    api_key=os.getenv("ANTHROPIC_API_KEY"),
)

message = client.messages.create(
    model="claude-3-5-sonnet-20241022",
    max_tokens=4096,
    temperature=0,
    messages=[
        {
            "role": "user",
            "content": [
                {
                    "type": "text",
                    "text": "You are an expert in data structures and algorithms, tasked with guiding a learner through problem-solving using JavaScript. Your goal is to help the learner understand core problem-solving strategies and improve their skills. \n\nHere is the problem you will be analyzing and solving:\n\n<problem_statement>\n"
                    + problem
                    + "\n</problem_statement>\n\nPlease follow these steps to analyze and solve the problem:\n\n1. Understanding & Visualization:\n   - Carefully read and analyze the problem statement.\n   - Identify the key components, constraints, and requirements.\n   - Provide a clear explanation of the problem in your own words.\n   - If applicable, use examples or diagrams to illustrate the problem.\n\n2. Brute Force Approach:\n   - Describe an intuitive, straightforward solution to the problem.\n   - Explain the logic behind this approach, even if it's not the most efficient.\n   - Discuss the time and space complexity of this solution.\n\n3. Optimization:\n   - Propose ways to improve the brute force solution.\n   - Consider more efficient algorithms or data structures that could be applied.\n   - Explain why these optimizations would improve the solution.\n   - Discuss the new time and space complexity after optimization.\n\n4. Solution Walk-through:\n   - Provide a step-by-step explanation of how the optimized solution works.\n   - Use the initial example from the problem statement to illustrate each step.\n   - Ensure that each step is clearly explained and easy to follow.\n\n5. Implementation:\n   - Write the JavaScript code for the optimized solution.\n   - Include detailed comments explaining the logic behind each significant part of the code.\n   - Ensure the code is well-structured and follows best practices.\n\nFor each step, wrap your thought process in <problem_solving_process> tags before providing your final analysis. This will help the learner understand how an expert approaches problem-solving. Inside these tags:\n\n1. Understanding & Visualization: List the key components, constraints, and requirements you've identified.\n2. Brute Force Approach: Outline the steps of the brute force solution.\n3. Optimization: List potential optimizations and briefly explain their impact.\n4. Solution Walk-through: Number each step in the optimized solution process.\n5. Implementation: Outline the main functions or components you plan to implement before writing the code.\n\nPresent your final analysis and solution in the following format:\n\n<analysis>\n1. Understanding & Visualization:\n[Your explanation here]\n\n2. Brute Force Approach:\n[Your explanation here]\n\n3. Optimization:\n[Your explanation here]\n\n4. Solution Walk-through:\n[Your explanation here]\n\n5. Implementation:\n```javascript\n// Your commented JavaScript code here\n```\n</analysis>\n\nRemember to adapt your explanations to the learner's level, providing clear and concise information that will help them understand and apply these problem-solving strategies in the future. Your goal is not just to solve the problem, but to teach the learner how to approach similar problems independently.",
                }
            ],
        },
        {
            "role": "assistant",
            "content": [{"type": "text", "text": "<problem_solving_process>"}],
        },
    ],
)

print(message.content[0].text)
