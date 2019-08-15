<template>
    <select class="bg-gray-200 p-1 mr-2" v-model="variation" @change="onChange(variation)">
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
                if (event.name == 'Brass Base') {
                    console.log('Neznam sta');
                }
                this.$emit('created', event);
                this.$emit('inquiry', event);
            },
        }
    }
</script>