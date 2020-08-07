### Main ###
print("*** Reading E-Book ***")
text, highlight = input("Text , Highlight : ").split(',')

text_split = text.split(highlight);
text_output = ('['+highlight+']').join(text_split)

print(text_output)

