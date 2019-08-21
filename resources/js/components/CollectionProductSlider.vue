<template>
    <viewer class="flex" :images="images" :options="{tooltip: false, title: false}">
        <div class="collection-products-images" v-for="img in images">
            <img class="cursor-pointer" :src="'/img/products/' + img.image" :alt="img.alt">
            <p class="text-center text-base p-1">{{ img.headline }}</p>
        </div>
    </viewer>
</template>

<script>
    import 'viewerjs/dist/viewer.css';

    export default {
        props: ['data'],

        data() {
            return {
                images: this.data
            }
        }
    }
</script>
