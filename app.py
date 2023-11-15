import streamlit as st
import pdfplumber

def read_pdf(file):
    with pdfplumber.open(file) as pdf:
        text = ""
        for page in pdf.pages:
            text += page.extract_text()
    return text

def main():
    st.title("PDF Reader App")

    # File upload
    uploaded_file = st.file_uploader("Choose a PDF file", type="pdf")

    if uploaded_file is not None:
        # Display file details
        st.write("File details:")
        st.write("Name:", uploaded_file.name)
        st.write("Size:", uploaded_file.size, "bytes")

        # Read PDF and display text
        st.write("PDF content:")
        text = read_pdf(uploaded_file)
        st.text(text)

if __name__ == "__main__":
    main()
