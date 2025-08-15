# Notes on Transformers
1. Measure Carbon Footprint of any LLM work [Link](https://huggingface.co/docs/hub/model-cards-co2) / [CodeCarbon](https://codecarbon.io/) is listed as a good one, plugs right into Python.

# General Transformer Architecture
1. **Encoders** - Accepts input and creates a representation of the input. Optimized for understanding based on the input. 
2. **Decoders** - Uses the encoders output (and other inputs). Optimized for returning outputs
3. There are **encoder-only**, **decoder-only**, and **encoder-decoder** models. They have different use cases that I'll explore later. 

4. **Attention layers** are important for sharing what keys or words to focus on. So that it weights whats important over the others. 

**Original Arch & Terms**
Designed for Translation, so...
A. Encoder received sentences to translate, all words are as important. (No Attention layer)
B. Decoder receives output from Encoder, but has to work in order. So that it's focusing on the words it most recently translated. 

1. Architecture - structure of the model
2. Checkpoints - weights of the given architecture, will be loaded in
3. Model - an umbrella work for any combination of the above

