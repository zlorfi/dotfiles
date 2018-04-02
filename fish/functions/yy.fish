function yy --description 'Use youtube-dl'
  youtube-dl -f 'bestvideo[ext!=webm]+bestaudio[ext!=webm]/best[ext!=webm]' $argv
end

