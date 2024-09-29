# put ids of touchpad into variable
ids=$(xinput list | grep -i touchpad | awk '{print $6}' | sed 's/id=//')

# go through each id and enable tapping and natural scrolling
for id in $ids; do
	xinput set-prop $id "libinput Tapping Enabled" 1
	xinput set-prop $id "libinput Natural Scrolling Enabled" 1
done
