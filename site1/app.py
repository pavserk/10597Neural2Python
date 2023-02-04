import streamlit as st
from PIL import Image
from segment import process

st.title('10597Neural2Python Распознавание MIST')
image_file = st.file_uploader('Загрузить изображение', type=['png', 'jpg'])
if not image_file is None:
    image = Image.open(image_file)
    results = process(image_file)
    st.write('Цифра на картинке: ', results)
