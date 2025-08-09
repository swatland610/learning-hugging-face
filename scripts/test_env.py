import torch, transformers, datasets, evaluate, accelerate

print("torch:", torch.__version__)
print("transformers:", transformers.__version__)
print("datasets:", datasets.__version__)
print("evaluate:", evaluate.__version__)
print("accelerate:", accelerate.__version__)

if torch.cuda.is_available():
    print("device: CUDA")
    print("cuda device count:", torch.cuda.device_count())
    print("current device:", torch.cuda.current_device())
    print("device name:", torch.cuda.get_device_name(0))
else:
    print("device: CPU")

# Tiny tokenizer sanity check
from transformers import AutoTokenizer
tok = AutoTokenizer.from_pretrained("bert-base-uncased")
print("tokenizer OK:", tok.pad_token_id is not None)
