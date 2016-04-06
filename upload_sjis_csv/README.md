```
Started POST "/welcomes" for ::1 at 2016-04-06 22:46:00 +0900
Processing by WelcomesController#create as HTML
  Parameters: {"utf8"=>"✓", "authenticity_token"=>"4J+id4tyA6NRN9THLJ2p6I/YmeXSr8tXlakFUolyZoa9WHyR6pb6DtAfQRqag4c8J8PGTFS+EO6KKrtdITSAGA==", "file"=>#<ActionDispatch::Http::UploadedFile:0x007faa1c499058 @tempfile=#<Tempfile:/var/folders/sd/9brs9jc95hzfwf7874qgk7w00000gn/T/RackMultipart20160406-11322-r0xjuq.csv>, @original_filename="ブック1.csv", @content_type="text/csv", @headers="Content-Disposition: form-data; name=\"file\"; filename=\"\xE3\x83\x95\xE3\x82\x99\xE3\x83\x83\xE3\x82\xAF1.csv\"\r\nContent-Type: text/csv\r\n">, "commit"=>"Save changes"}
"------------------------------------------------------------------------------"
#<ActionDispatch::Http::UploadedFile:0x007faa1c499058 @tempfile=#<Tempfile:/var/folders/sd/9brs9jc95hzfwf7874qgk7w00000gn/T/RackMultipart20160406-11322-r0xjuq.csv>, @original_filename="ブック1.csv", @content_type="text/csv", @headers="Content-Disposition: form-data; name=\"file\"; filename=\"\xE3\x83\x95\xE3\x82\x99\xE3\x83\x83\xE3\x82\xAF1.csv\"\r\nContent-Type: text/csv\r\n">
"------------------------------------------------------------------------------"
"\x8F\xA4\x95i\x96\xBC,\x89\xBF\x8Ai\r\n\x82\xE8\x82\xF1\x82\xB2,200\r\n\x82\xDD\x82\xA9\x82\xF1,100\r\n\x82\xD4\x82\xC7\x82\xA4,250"
#<Encoding:ASCII-8BIT>
"------------------------------------------------------------------------------"
"\x{8FA4}\x{9569}\x{96BC},\x{89BF}\x{8A69}\r\n\x{82E8}\x{82F1}\x{82B2},200\r\n\x{82DD}\x{82A9}\x{82F1},100\r\n\x{82D4}\x{82C7}\x{82A4},250"
#<Encoding:Windows-31J>
"------------------------------------------------------------------------------"
"商品名,価格\r\nりんご,200\r\nみかん,100\r\nぶどう,250"
#<Encoding:UTF-8>
"------------------------------------------------------------------------------"
Redirected to http://localhost:3000/welcomes
Completed 302 Found in 2ms (ActiveRecord: 0.0ms)
```