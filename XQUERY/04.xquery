<marvel> {
for $superheroe in doc("superheroes.xml")/marvel/superheroe
where contains(lower-case($superheroe/@poderes), 'fuerza')
and contains($superheroe/@amigos, 'Iron Man')
return <superheroe>{$superheroe}</superheroe>
}
</marvel>