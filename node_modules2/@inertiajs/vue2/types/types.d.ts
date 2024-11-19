import { createHeadManager, Page, PageHandler, router } from '@inertiajs/core';
import { ComponentPublicInstance } from 'vue';
import useForm, { InertiaFormTrait } from './useForm';
export type VuePageHandlerArgs = Parameters<PageHandler>[0] & {
    component: ComponentPublicInstance | Promise<ComponentPublicInstance>;
};
declare module '@inertiajs/core' {
    interface Router {
        form: typeof useForm;
    }
}
export type InertiaHeadManager = ReturnType<typeof createHeadManager>;
declare module 'vue/types/vue' {
    interface Vue {
        $inertia: typeof router & InertiaFormTrait;
        $page: Page;
        $headManager: InertiaHeadManager;
    }
}
