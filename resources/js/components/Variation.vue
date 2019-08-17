<template>
    <select class="bg-gray-200 p-1" v-model="variation" @change="onChange(variation)">
        <option v-for="subvariation in subvariations"
                v-if="subvariation.products_id === product.id"
                :value="subvariation"
        >
            {{ subvariation.name ? subvariation.name : subvariation.variation_name }}
        </option>
    </select>
</template>

<script>
    export default {
        props: ['data', 'product'],

        data() {
            return {
                subvariations: this.data,
                image: '',
                variation: ''
            }
        },

        methods: {
            onChange(event) {
                this.image = event.image ? event.image : this.product.image;
                if (event.variations_id === 6) {
                    this.$emit('varijacija', event);
                }
                if (event.variations_id === 1)  {
                    this.$emit('varijacija', event);
                }
                if (event.variations_id === 7) {
                    this.$emit('varijacija', event);
                }
                this.$emit('created', event);
                this.$emit('inquiry', event);
            },
        }
    }
</script>