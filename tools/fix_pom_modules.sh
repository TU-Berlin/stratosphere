#!/usr/bin/env bash


poms=`find .. -name pom.xml`
for p in $poms; do
  # write into tmp file because in-place replacement is not possible (if nupom="pom.xml")
  tmp_nuname="`dirname $p`/__generate_specific_pom_tmp"
  # Now we do search and replace of explicit strings.  The best way of
  # seeing what the below does is by doing a diff between the original
  # pom and the generated pom (pom.hadoop1.xml or pom.hadoop2.xml). We
  # replace the version string in all poms, we change modules to
  # include reference to the non- standard pom name, we adjust
  # relative paths so child modules can find the parent pom, and we
  # enable/disable hadoop 1 and hadoop 2 profiles as appropriate
  # removing a comment string too. We output the new pom beside the
  # original.
  sed -e "s/\\/pom\.xml\<\\/module\>/\<\\/module\>/g" \
  -e "s/\<relativePath\>\.\.\\/pom\.xml\<\\/relativePath\>/\<relativePath\>\.\.\<\\/relativePath\>/g" \
  $p > "$tmp_nuname"
  mv $tmp_nuname $p
done

