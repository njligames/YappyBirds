#git filter-branch --index-filter 'git rm -rf --cached --ignore-unmatch APPLE/IOS/fmod/android/' HEAD
#git for-each-ref --format="%(refname)" refs/original/ | xargs -n 1 git update-ref -d
#git filter-branch --index-filter 'git rm -rf --cached --ignore-unmatch APPLE/IOS/fmod/mac/' HEAD
#git for-each-ref --format="%(refname)" refs/original/ | xargs -n 1 git update-ref -d
#git filter-branch --index-filter 'git rm -rf --cached --ignore-unmatch APPLE/IOS/fmod/ios/_FMOD\ Programmers\ API/' HEAD
#git for-each-ref --format="%(refname)" refs/original/ | xargs -n 1 git update-ref -d
#git filter-branch --index-filter 'git rm -rf --cached --ignore-unmatch APPLE/IOS/fmod/ios/OLD/' HEAD
#git for-each-ref --format="%(refname)" refs/original/ | xargs -n 1 git update-ref -d
#git filter-branch --index-filter 'git rm -rf --cached --ignore-unmatch APPLE/IOS/fmod/ios/FMOD\ Programmers\ API/doc/' HEAD
#git for-each-ref --format="%(refname)" refs/original/ | xargs -n 1 git update-ref -d
#git filter-branch --index-filter 'git rm -rf --cached --ignore-unmatch APPLE/IOS/fmod/ios/FMOD\ Programmers\ API/tools/' HEAD
#git for-each-ref --format="%(refname)" refs/original/ | xargs -n 1 git update-ref -d
#git filter-branch --index-filter 'git rm -rf --cached --ignore-unmatch APPLE/IOS/fmod/ios/FMOD\ Programmers\ API/api/studio/' HEAD
#git for-each-ref --format="%(refname)" refs/original/ | xargs -n 1 git update-ref -d
#git filter-branch --index-filter 'git rm -rf --cached --ignore-unmatch APPLE/IOS/fmod/ios/FMOD\ Programmers\ API/api/lowlevel/examples/' HEAD
#git for-each-ref --format="%(refname)" refs/original/ | xargs -n 1 git update-ref -d
git filter-branch --index-filter 'git rm -rf --cached --ignore-unmatch YappyBirds jamesfolk$ /Users/jamesfolk/NJLI/YappyBirds/COMMON/assets/*' HEAD
git for-each-ref --format="%(refname)" refs/original/ | xargs -n 1 git update-ref -d
