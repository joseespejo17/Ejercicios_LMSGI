<marvel> {
for $superheroe in doc("superheroes.xml")/marvel/superheroe
where ends-with($superheroe/@nombre, 'a')
return <superheroe>{$superheroe}</superheroe>
}
</marvel>