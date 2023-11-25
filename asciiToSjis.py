import pyperclip
import codecs

def ascii_to_shiftjis(text):
    # Define a translation table to map ASCII characters to Shift JIS
    translation_table = str.maketrans(
        'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789',
        'ＡＢＣＤＥＦＧＨＩＪＫＬＭＮＯＰＱＲＳＴＵＶＷＸＹＺａｂｃｄｅｆｇｈｉｊｋｌｍｎｏｐｑｒｓｔｕｖｗｘｙｚ０１２３４５６７８９'
    )
    
    # Use translate to convert ASCII characters to Shift JIS equivalents
    shifted_text = text.translate(translation_table)
    
    return shifted_text

def main():
    # Get input from the user
    ascii_text = input("Enter ASCII text: ")
    
    # Convert ASCII to Shift JIS
    shiftjis_text = ascii_to_shiftjis(ascii_text)
    
    # Copy the Shift JIS text to the clipboard
    pyperclip.copy(shiftjis_text)
    
    print(f"Shift JIS equivalent copied to clipboard: {shiftjis_text}")

if __name__ == "__main__":
    main()
