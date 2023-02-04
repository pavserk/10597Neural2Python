from tensorflow.keras.models import load_model
import os

MODEL_NAME = 'model_fmr_all.h5'
import numpy as np
from PIL import Image

model = load_model(MODEL_NAME)
INPUT_SHAPE = (28, 28, 1)


def process(image_file):
    try:
        print(os.environ['PORT'])
    except:
        print("PORT not found")
    image = Image.open(image_file).convert('L')
    resized_image = image.resize(
        (INPUT_SHAPE[1], INPUT_SHAPE[0]))

    img = 255 - np.array(resized_image)
    img[img < 50] = 0
    image = img.reshape(-1, 28, 28, 1)
    predict1 = model.predict(image)
    print(predict1)
    cls_image = np.argmax(predict1)
    print(cls_image)

    return cls_image
