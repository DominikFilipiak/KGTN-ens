for filename in ./n*.tar; do
    [ -e "$filename" ] || continue
    s=${filename##*/}
    s2=${s%.*}
    # ... rest of the loop body
    tar -xf ${s2}.tar --xform="s|^|${s2}/|S"
done
