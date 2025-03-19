#!/bin/bash

# List of URLs
urls=(
   "https://manifest-gcp-us-east1-vop1.cfcdn.mux.com/cyM6hngjcMimZXD4HopGv01DU00N9tHcJihzX6sYvFRGCw00ryfB5L00bK2kVWFyCWG87icLXf5jr901HLtvP01k28t32UgOnrUEbVectFFIYaoC4/rendition.m3u8?cdn=cloudflare&expires=1732958280&skid=default&signature=Njc0YWQ4NDhfYWI5OGI2MDYwZWM5NzQ1Y2EzOTJmMmE4ZGQ4NmNmZjVjNTMwMmYyYzMxYzc4YmIzMGM0NjhiMWEzZTJmZWIzZg==&vsid=1iVmvm502VSDNiC1AcpZhfQOFHvoQ5pF4xFQGXSzgcnHyf36uvPRSnzOfcFj2DiET5d8k6W5p00Q00",
   "https://manifest-gcp-us-east1-vop1.cfcdn.mux.com/mE02pzy7tS2ZcS485qh394dpwOJ8E39wVw3PZ6QZG7h8dqjjrIDDlHfLU8EuzT02Zpx1tCmCK6b01c6uFKL64beRUAqE7VlurLTb00aZIV3fj01M/rendition.m3u8?cdn=fastly&expires=1732958340&skid=default&signature=Njc0YWQ4ODRfZmJmOGMxN2NkNDA3N2UyM2UzOTFkNDA0NjhmNWQ3ZjQ3ZGM1NjZmMTFjNDM4MzBiOWFlMmFkMjkxMGNhNThlYg==&vsid=cqN12aGhX20201yIl3YzloScgNFZwF02GcuJRCoP2D025aHpdta02928cf9AhUxDQ6ZyOMeyq02lI4hK4",
   "https://manifest-gcp-us-east4-vop1.cfcdn.mux.com/2aWvLXfBGhocz01g0000HpEUpa7xk1f4CLipP14KzbXvytvES8WrIzBCyJXMDEaZb00ckv3hrGPocjTbj6Sc9J4iyXZ232xqALSGnEpGJL6Nt2U/rendition.m3u8?cdn=cloudflare&expires=1732958400&skid=default&signature=Njc0YWQ4YzBfMTQ3ZWM1Yjg5Y2UyZjgxNTUwMDliMTliMDExZWFlMzdlZTM0NTdjZWU2NTkxN2RmZTI5NjJiNGE4YWFhZmQ2Mg==&vsid=ReKW00M02H8R9mEM7qw9p02Fai23F01796W9oxMXZr7mtDvbIQlJL00T17NPXmQ4bbAHxduFxUXF008tI",
   "https://manifest-gcp-us-east4-vop1.cfcdn.mux.com/rSZaCnzaE003Ogta9ftGtMpSp3ci2ueP3Kx31ghIph7ipV544CBu9rIAJ102hO2ZSDdPOp8Xe02eNAugxZ02qjlqGbQg2oR01px9QAkU5PdaAIVM/rendition.m3u8?cdn=cloudflare&expires=1732958460&skid=default&signature=Njc0YWQ4ZmNfYWViOGJjOGRlZjA1OTJhY2YyZTYyNmViNWZiMjUzMWY1ZDNiNTM3ZmFhYzZhNjRhYWVhMzNmZTY4NjBkMTk3Yg==&vsid=tMXSRTpPbIlWcu2IRL4eqq3LbO8Q01Cocm9x6wdbM02MFlJST4pikAWiW779tLLIVuee9KAiNv01Hk",
   "https://manifest-gcp-us-east4-vop1.cfcdn.mux.com/VGS900bL600CAG00301HAGoCFppbfVTqkm7UW4AR02NKKRc02Qz01C01C6Rc3ZJXQERgiwVhpTHl2017An016UjEx6uk6cyWJ2qLwiKhF7kcBlhrg2YII/rendition.m3u8?cdn=fastly&expires=1732958460&skid=default&signature=Njc0YWQ4ZmNfNDliYzRkNDVlOTMwZGRhNTYwODU0YWUxNjE4MmJhOGRhZWNkYmQxNjUzOGZkMTliYmJjMmMxNTNkYjUyNGYwNg==&vsid=bY1bIfMafAfJYoDO00itFuefW5tl4replaEpFVqJiBCW01lkwJEcZ9Qw7uzCQ00yJcA9hStUFvDhic"
)

# Corresponding list of output filenames
filenames=(
 "OperasioperasipadaFungsi.mp4",
 "OperasiInvers_MencerminkanGrafikpadaGarisysamadenganx.mp4",
 "FungsiTrigonometridariPerspektifLingkaran.mp4",
 "Grafik Fungsi Sinusoidal dan Cosinus.mp4",
 "Grafik Fungsi Tangen dan Identitas Trigonometri.mp4"
)

# Debug: Print the lengths of the arrays
echo "Number of URLs: ${#urls[@]}"
echo "Number of Filenames: ${#filenames[@]}"

# Check if both arrays have the same length
if [ ${#urls[@]} -ne ${#filenames[@]} ]; then
    echo "The number of URLs does not match the number of filenames."
    exit 1
fi

for i in "${!urls[@]}"; do
    url="${urls[i]}"
    filename="${filenames[i]}"
    echo "Downloading $url to $filename"
    ffmpeg -i "$url" -c copy "$filename"
    if [[ $? -ne 0 ]]; then
        echo "Failed to download $url"
    fi
done
