%dw 2.0
output application/json
---
vars.caseUpdateRequest mapObject {
(($$) : if ( ($$ as String) != "Customer")  $
              else ( $ mapObject {
                     ($$) : if (($$ as String) != "ContactInformation") $ 
                              else (($ default []) map {
                                                (($) ++ {
                                                       ("PhoneNumber": $.CountryCode ++ $.Number)      if (($.CountryCode != null) and ($.Number != null))
                                                })     
                                         }  )
                     }      
              )
) 
}