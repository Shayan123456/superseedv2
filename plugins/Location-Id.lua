do

function run(msg, matches)
   send_document(get_receiver(msg), "./Location-Id.json", ok_cb, false)
end

return {
patterns = {
"^Loc$",

},
run = run
}

end
