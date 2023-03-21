package main
import(
	"encoding/json"
	"net/http"
	"io/ioutil"
)

func CheckBody(r *http.Request, x interface{}){
	if body,err:= ioutil.ReadAll(r.Body); err == nil{
		if err := json.Unmarshal([]byte(body), x); err != nil{
			return 
		}
	}
}
/*Les attaques de ransomware ont augmenté en fréquence et en sophistication ces dernières années, et elles constituent une menace
 majeure pour les entreprises. Les cybercriminels utilisent des méthodes 
sophistiquées pour infiltrer les réseaux informatiques et crypter les données, exigeant ainsi des rançons pour les débloquer.*/