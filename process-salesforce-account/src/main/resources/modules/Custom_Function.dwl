import try, fail from dw::Runtime
import modules::countryList

fun formatAsDate(datestr) = do {
  var dateTimeValue=  try(()-> (datestr as Date {format: 'dd/MM/yyyy'}  as Date {format: 'yyyy-MM-dd'}))
   ---
  if(dateTimeValue.success) (dateTimeValue.result) else null
}

fun formatAsDateTime(dateString) = do{   
    var dateTimeValue = try(() -> dateString as LocalDateTime { format: "dd/MM/yyyy HH:mm" } as DateTime {format: "yyyy/MM/dd hh:mm a"})
    ---
    if(dateTimeValue.success) (dateTimeValue.result) else null

}

fun formatAsBool(boolstr) = do {
	var bValue = try(() ->  boolstr as Boolean)
    ---
    if(bValue.success) (bValue.result) else null
}

fun getCountry(countryCode) = do{
	{(countryList::list filter ($.code ~= countryCode))}.name
}