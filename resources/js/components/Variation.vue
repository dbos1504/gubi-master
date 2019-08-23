<template>
    <div>
    <select class="bg-gray-200 p-1" v-model="variation" @change="onChange(variation)">
        <option v-for="subvariation in subvariations"
                v-if="subvariation.products_id == product.id"
                :value="subvariation"
        >
            {{ subvariation.name ? subvariation.name : subvariation.variation_name }}
        </option>
    </select>
    <select v-if="variation.options" v-model="options" class="bg-gray-200 p-1 sub-var" @change="onChange(options)">
        <option v-for="vari in variation.options"
                :value="vari"
                v-if="vari.sub_variations_id == variation.id"
        >
            {{ vari.name}}
        </option>
    </select>
    </div>
</template>

<script>
    export default {
        props: ['data', 'product'],

        data() {
            return {
                subvariations: this.data,
                image: '',
                variation: '',
                options: ''
            }
        },

        computed: {
            filterDistricts () {
                for( let i = 0; i < this.product.subvariations.length; i++) {
                    for (let u = 0; u < this.product.subvariations[i].options.length; u++) {
                        if(this.product.subvariations[i].options[u].sub_variations_id == this.product.subvariations[i].id) {
                            // this.variation.push(this.product.subvariations[i].options[u])
                        }
                    }
                }
            },

            broj() {
                return this.variation;
            }
        },

        methods: {
            onChange(event) {
                this.image = event.image ? event.image : this.product.image;

                if (event.variations_id == 6) {
                    this.$emit('varijacija', event);
                }
                if (event.variations_id == 1)  {
                    this.$emit('varijacija', event);
                    console.log(event);
                }
                if (event.variations_id == 7) {
                    this.$emit('varijacija', event);
                }
                this.$emit('created', event);
                this.$emit('inquiry', event);
            },
            onChangee(event) {
                console.log(event.image)
                // this.image = event.image ? event.image : this.product.image;
                //
                // if (event.variations_id == 6) {
                //     this.$emit('varijacija', event);
                // }
                // if (event.variations_id == 1)  {
                //     this.$emit('varijacija', event);
                //     console.log(event);
                // }
                // if (event.variations_id == 7) {
                //     this.$emit('varijacija', event);
                // }
                // this.$emit('created', event);
                // this.$emit('inquiry', event);
            },
        }
    }
</script>