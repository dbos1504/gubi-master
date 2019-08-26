<template>
    <div>
        <select class="bg-gray-200 p-1 w-full" v-model="variation" @change="onChange(variation)">
            <option value="0" disabled>Choose...</option>
            <option v-for="subvariation in subvariations"
                    v-if="subvariation.products_id == product.id"
                    :value="subvariation"
            >
                {{ subvariation.name }}
            </option>
        </select>
        <select v-if="broj >= 1" v-model="options" class="bg-gray-200 p-1 sub-var w-full" @change="onChange(options)">
            <option value="0" disabled>Choose...</option>
            <option v-for="vari in variation.options"
                    :value="vari"
                    v-if="vari.sub_variations_id == variation.id"
            >
                {{ vari.name }}
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
            broj() {
                if (this.variation.options) {
                    return this.variation.options.length;
                }

            }
        },

        methods: {
            onChange(event) {
                this.image = event.image ? event.image : this.product.image;

                if (event.variations_id == 6) {
                    this.$emit('varijacija', event);
                    console.log(event)
                }
                if (event.variations_id == 1)  {
                    this.$emit('varijacija', event);
                }
                if (event.variations_id == 1)  {
                    this.$emit('varijacija', event);
                }
                if (event.variations_id == 7) {
                    this.$emit('varijacija', event);
                }
                if (event.variations_id == 8) {
                    this.$emit('plug', event);
                }
                if (event.variations_id == 3) {
                    this.$emit('varijacija', event);
                    console.log(event.name)
                }
                this.$emit('created', event);
                this.$emit('inquiry', event);
            },
        }
    }
</script>