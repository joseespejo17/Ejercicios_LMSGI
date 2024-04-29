<marvel> {
let $superheroe := doc("superheroes.xml")/marvel/superheroe
return <superheroe>{avg($superheroe/@nivel)}</superheroe>
}
</marvel>